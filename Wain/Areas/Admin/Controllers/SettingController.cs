using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;
using Wain.ViewModels.Settings;

namespace Wain.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class SettingController : Controller
    {
        private readonly AppDbContext _context;

        public SettingController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int page = 0) 
        {
            List<Settings> settings = await _context.Settings.Skip(page * 3).Take(3).ToListAsync();
            PaginateVM<Settings> paginateVM = new PaginateVM<Settings>
            {
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Settings.Count() / 3),
                Items = settings
            };
            return View(paginateVM);
        }

        public async Task<IActionResult> Update(int? id)
        {
            if (id == null || id < 1) return BadRequest();

            Settings settings = await _context.Settings.FirstOrDefaultAsync(x => x.Id == id);
            if (settings == null) return BadRequest();
            UpdateSettingVM settingVM = new UpdateSettingVM
            {
                Key = settings.Key,
                Value = settings.Value,
            };
            return View(settingVM);
        }

        [HttpPost]
        public async Task<IActionResult> Update(int id, UpdateSettingVM setting)
        {
            if (id == null || id < 1) return BadRequest();

            Settings existed = await _context.Settings.FirstOrDefaultAsync(x => x.Id == id);
            if (existed == null) return BadRequest();
            existed.Value = setting.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Setting");
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id is null || id < 1) return BadRequest();

            Settings settings = await _context.Settings.FirstOrDefaultAsync(s => s.Id == id);

            if (settings is null) return NotFound();
            _context.Settings.Remove(settings);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
