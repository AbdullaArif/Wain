using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;

namespace Wain.Controllers
{
    public class ContactController : Controller
    {
        private readonly AppDbContext _context;

        public ContactController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Index(ContactVM contactVM)
        {
            Contact newMessage = new Contact()
            {
                Name = contactVM.Name,
                Subject = contactVM.Subject,
                Message = contactVM.Message,
                Number = contactVM.Number,
                Email = contactVM.Email,
            };
            if (string.IsNullOrEmpty(contactVM.Email))
            {
                ModelState.AddModelError(nameof(contactVM.Email), "Email is required.");
                return View(contactVM);
            }

            await _context.Contacts.AddAsync(newMessage);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index","Home");
        }
    }
}
