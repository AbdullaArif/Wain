using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;

namespace Wain.Controllers
{
    public class CarController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public CarController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index(bool? isrent,int? bodystyleId, string? Brand, int? fueltypeId, int? colorId, int page = 0)
        {
            List<Car> car = await _context.Cars.Include(c => c.FuelType).Include(c => c.BodyStyle).Include(c => c.Color).ToListAsync();
            IQueryable<Car> query = _context.Cars.Include(c => c.CarImages).AsQueryable();
            if (isrent != null)
            {
                query = query.Where(c => c.BodyStyleId == bodystyleId);
            }
            if (bodystyleId != null) 
            {
                query = query.Where(c => c.BodyStyleId == bodystyleId );
            }
            if (fueltypeId != null) 
            {
                query = query.Where(c => c.FuelTypeId == fueltypeId);
            }
            if (colorId != null) 
            {
                query = query.Where(c => c.ColorId == colorId);
            }
            if (Brand != null)
            {
                query = query.Where(c => c.Brand == Brand);
            }
            CarsVM carVM = new CarsVM()
            {
                BodyStyles = await _context.BodyStyles.Include(c => c.Cars).ToListAsync(),
                FuelTypes = await _context.FuelTypes.Include(c => c.Cars).ToListAsync(),
                Colors = await _context.Colors.Include(c => c.Cars).ToListAsync(),
                Cars = await query.ToListAsync(),
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Cars.Count() / 3),
                Items = car
            };
            return View(carVM);
        }
    }
}
