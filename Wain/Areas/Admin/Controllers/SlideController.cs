using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Wain.DAL;
using Wain.Models;
using Wain.Utilities.Extensions;
using Wain.ViewModels;
using Wain.ViewModels.Slide;

namespace Wain.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class SlideController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public SlideController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public async Task<IActionResult> Index(int page = 0)
        {
          
            List<Slide> slides = await _context.Slides.Skip(page * 3).Take(3).ToListAsync();

            PaginateVM<Slide> paginateVM = new PaginateVM<Slide>
            {
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Slides.Count()/3),
                Items = slides
            };
            return View(paginateVM);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(CreateSlideVM slide)
        {
            if (slide.Photo is null)
            {
                ModelState.AddModelError("Photo","The image you send cannot be empty");
                return View();
            }
            if (!slide.Photo.CheckFileType("image/"))
            {
                ModelState.AddModelError("Photo","The file type is not suitable");
                return View();
            }
            if (!slide.Photo.CheckFileSize(500))
            {
                ModelState.AddModelError("Photo","File size should not exceed 500 kb");
                return View();
            }
            Slide newSlide = new Slide
            {
                Title = slide.Title,
                SubTitle = slide.SubTitle,
                Order = slide.Order,
                Image = await slide.Photo.CreateFileAsync(_env.WebRootPath, "assets/img")
            };
            await _context.Slides.AddAsync(newSlide);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Update(int? id)
        {
            if (id is null || id < 1) return BadRequest();

            Slide existed = await _context.Slides.FirstOrDefaultAsync(s => s.Id == id);

            if (existed is null) return NotFound();

            UpdateSlideVM slideVM = new UpdateSlideVM
            {
                Title = existed.Title,
                SubTitle = existed.SubTitle,
                Order = existed.Order,
                Image = existed.Image,
            };
            return View(slideVM);
        }
        [HttpPost]
        public async Task<IActionResult> Update(int? id, UpdateSlideVM slide)
        {
            if (id is null || id < 1) return BadRequest();
           
            Slide existed = await _context.Slides.FirstOrDefaultAsync(s => s.Id == id);
           
            if (existed is null) return NotFound();
          
            if (slide.Photo != null)
            {
                if (!slide.Photo.CheckFileType("image/"))
                {
                    ModelState.AddModelError("Photo","The file type is not suitable");
                    return View();
                }
                if (!slide.Photo.CheckFileSize(500))
                {
                    ModelState.AddModelError("Photo","File size should not exceed 500 kb");
                    return View();
                }
                existed.Image.DeleteFile(_env.WebRootPath, "assets/img");
                existed.Image = await slide.Photo.CreateFileAsync(_env.WebRootPath,"assets/img");
            }
            existed.Title = slide.Title;
            existed.SubTitle = slide.SubTitle;
            existed.Order = slide.Order;

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Delete(int? id)
        {
            if (id is null || id < 1) return BadRequest();

            Slide slide = await _context.Slides.FirstOrDefaultAsync(s => s.Id == id);

            if (slide is null) return NotFound();

            slide.Image.DeleteFile(_env.WebRootPath,"assets/img");

            _context.Slides.Remove(slide);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
