using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;

namespace Wain.Controllers
{
    public class AboutController : Controller
    {
        private readonly AppDbContext _context;
        public AboutController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        { //Inclufe car
            List<Agent> agents = await _context.Agents.ToListAsync();
            List<Car> cars = await _context.Cars.ToListAsync();
            List<ServiceCustom> service = await _context.ServiceCustoms.ToListAsync();
            AboutVM aboutVM = new AboutVM
            {
                Cars=cars,
                Agents = agents,
                ServiceCustoms = service
            };
            return View(aboutVM);
        }
    }
}
