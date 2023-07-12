using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;

namespace Wain.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        public HomeController(AppDbContext context)
        {
            _context = context;  
        }
        public async Task<IActionResult> Index(string? Brand)
        {
            List<Slide> slides = await _context.Slides.OrderBy(s => s.Order).Take(3).ToListAsync();
            IQueryable<Car> query = _context.Cars
                .Include(c => c.CarImages)
                .Include(c => c.Color)
                .Include(c => c.BodyStyle)
                .Include(c => c.FuelType).AsQueryable();
            if (Brand != null) 
            {
                query = query.Where(c => c.Brand == Brand);
            }
            HomeVM homeVM = new HomeVM
            {
                Sliders = slides,               
                Cars = await query.ToListAsync(),

            };

            return View(homeVM);
        }
        public async Task<IActionResult> Details(int? id)
        {
            if (id is null || id < 1) return BadRequest();
           
            var car = await _context.Cars
                .Include(c => c.CarImages)
                .Include(c => c.Color)
                .Include(c => c.BodyStyle)
                .Include(c => c.FuelType)                
               .FirstOrDefaultAsync(c => c.Id == id);/*Include(c=>c.Agent)*/
            Agent agent = await _context.Agents.FirstOrDefaultAsync(a => a.Id == car.AgentId);
            if (car == null) return NotFound();

            List<Car> Cars = _context.Cars.Include(c => c.CarImages).Include(c => c.BodyStyle).Include(c => c.FuelType).Where(c => c.Id != car.Id && c.Brand == car.Brand).ToList();
            DetailsVM detailsVM = new DetailsVM
            {
                Car = car,
                Cars = Cars,
                Agent = agent
            };


            return View(detailsVM);
        }
        [HttpPost]
        public IActionResult Index(RentalCalculatorModel model)
        {
            if (ModelState.IsValid)
            {
                decimal totalAmount = model.CarPrice * model.RentalDays;
                decimal discountPercentage = 0;

                if (model.RentalDays > 30)
                {
                    discountPercentage = 0.20m;
                }
                else if (model.RentalDays > 20)
                {
                    discountPercentage = 0.15m;
                }
                else if (model.RentalDays > 10)
                {
                    discountPercentage = 0.10m;
                }

                decimal discountAmount = totalAmount * discountPercentage;
                decimal payableAmount = totalAmount - discountAmount;

                ViewBag.TotalAmount = totalAmount;
                ViewBag.DiscountAmount = discountAmount;
                ViewBag.PayableAmount = payableAmount;

                return View("Details", model);
            }

            return View("Details", model);
        }
    }
}