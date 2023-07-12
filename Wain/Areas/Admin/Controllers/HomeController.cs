using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Wain.Areas.Admin.Controllers
{


    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;


        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {

            return View();
        }
        public async Task<IActionResult> ContactMessage(int page = 0)
        {
            List<Contact> contacts = await _context.Contacts.ToListAsync();
        
            return View(contacts);

        }
    }
}
