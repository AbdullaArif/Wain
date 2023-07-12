using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.ViewModels;

namespace Wain.Controllers
{
    public class AgentController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        public AgentController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index(int page = 0)
        {

            List<Agent> agents = await _context.Agents.ToListAsync();
            AgentVM agentVM = new AgentVM()
            {
                Agents = agents,
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Agents.Count() / 3),


            };
            PaginateVM<Agent> paginateVM = new PaginateVM<Agent>
            {
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Agents.Count() / 3),
                Items = agents
            };
            return View(agentVM);
        }
        public async Task<IActionResult> Details(int? id)
        {
            if (id is null || id < 1) return BadRequest();
            Agent agent = await _context.Agents.FirstOrDefaultAsync(a => a.Id == id);
            //if (agent == null) return NotFound();

            

            List<Car> cars = await _context.Cars
               .Include(c => c.CarImages)
               .Include(c => c.FuelType)
               .Include(c => c.BodyStyle)
               .Include(c => c.Color)
               .Where(c => c.AgentId == id)
              .ToListAsync();
            DetailsVM detailsVM = new DetailsVM
            {
                
                Cars = cars,
                Agent = agent
            };

            return View(detailsVM);
        }
    }
}