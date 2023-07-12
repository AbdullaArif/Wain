using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using Wain.DAL;
using Wain.ViewModels.Settings;
using Wain.ViewModels;
using Microsoft.EntityFrameworkCore;
using Wain.Models;
using Wain.ViewModels.ServiceCustom;

namespace Wain.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class ServiceCustomController : Controller
    {


        private readonly AppDbContext _context;

        public ServiceCustomController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int page = 0)
        {
            List<ServiceCustom> services = await _context.ServiceCustoms.Skip(page * 3).Take(3).ToListAsync();
            PaginateVM<ServiceCustom> paginateVM = new PaginateVM<ServiceCustom>
            {
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Settings.Count() / 3),
                Items = services
            };
            return View(paginateVM);
        }

        public async Task<IActionResult> Update(int? id)
        {
            if (id == null || id < 1) return BadRequest();

            ServiceCustom service = await _context.ServiceCustoms.FirstOrDefaultAsync(x => x.Id == id);
            if (service == null) return BadRequest();
            UpdateServiceVM serviceVM = new UpdateServiceVM
            {
                Key = service.Key,
                Value = service.Value,
                Description = service.Description,
            };
            return View(serviceVM);
        }

        [HttpPost]
        public async Task<IActionResult> Update(int id, UpdateServiceVM service)
        {
            if (id == null || id < 1) return BadRequest();

            ServiceCustom existed = await _context.ServiceCustoms.FirstOrDefaultAsync(x => x.Id == id);
            if (existed == null) return BadRequest();
            existed.Value = service.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "servicecustom");
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id is null || id < 1) return BadRequest();

            ServiceCustom service = await _context.ServiceCustoms.FirstOrDefaultAsync(s => s.Id == id);

            if (service is null) return NotFound();
            _context.ServiceCustoms.Remove(service);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
