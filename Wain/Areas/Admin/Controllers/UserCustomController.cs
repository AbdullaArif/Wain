using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Security.Claims;
using Wain.DAL;
using Wain.Models;
using Wain.Utilities.Enums;

namespace Wain.Areas.Admin.Controllers
{   [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class UserCustomController : Controller
    {



        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;


        public UserCustomController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Seller()
        {
            List<Agent> agents = await _context.Agents.ToListAsync();
            return View(agents);
        }
        public async Task<IActionResult> Member()
        {
          List<AppUser> users =(List<AppUser>) await  _userManager.GetUsersInRoleAsync(UserRole.Member.ToString());
            //var roles = _userManager.FindByNameAsync(User.ToString());
            ////string role = User.FindAll(ClaimTypes.Role) ?;
            //if (roles.Id == "member")
            //{
            //    return View(roles);
            //}

            return View(users);
        }
    }
}
