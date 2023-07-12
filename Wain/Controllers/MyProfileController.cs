using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;
using Wain.Utilities.Enums;
using Wain.Utilities.Extensions;
using Wain.ViewModels;
using Wain.ViewModels.MyProfile;
using Wain.ViewModels.Slide;

namespace Wain.Controllers
{
    public class MyProfileController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly IWebHostEnvironment _env;

        public MyProfileController(AppDbContext context, UserManager<AppUser> userManager, IWebHostEnvironment env)
        {
            _context = context;
            _userManager = userManager;
            _env = env;
        }
        public async Task<IActionResult> Seller(int page = 0)
        {

            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
            Agent agent = await _context.Agents.FirstOrDefaultAsync(a => a.Id == user.AgentId);
            
            List<Car> cars = await _context.Cars
               .Include(c => c.CarImages)
               .Include(c => c.FuelType)
               .Include(c => c.BodyStyle)
               .Include(c => c.Color)
               .Where(c => c.AgentId == user.AgentId)
              .ToListAsync();
            PaginateVM<Car> paginateVM = new PaginateVM<Car>
            {   Agent=agent,
                CurrentPage = page,
                TotalPage = Math.Ceiling((decimal)_context.Cars.Count() / 3),
                Items = cars
            };
            return View(paginateVM);
        }
        public async Task<IActionResult> Create()
        {
            ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
            ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
            ViewBag.Colors = await _context.Colors.ToListAsync();
            return View();
        }
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Create(CreateCarVM carVM)
        {
            ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
            ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
            ViewBag.Colors = await _context.Colors.ToListAsync();

            if (!ModelState.IsValid)
            {
                ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
                ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
                ViewBag.Colors = await _context.Colors.ToListAsync();
                return View();
            }

            var currentUser = await _userManager.FindByNameAsync(User.Identity?.Name);
            Car car = new Car()
            {
                Brand = carVM.Brand,
                March = carVM.March,
                Model = carVM.Model,
                Transmission = carVM.Transmission,
                Location = carVM.Location,
                Engine = carVM.Engine,
                Description = carVM.Description,
                GraduationYear = carVM.GraduationYear,
                Price = carVM.Price,
                HorsePower = carVM.HorsePower,
                ColorId = carVM.ColorId,
                BodyStyleId = carVM.BodyStyleId,
                FuelTypeId = carVM.FuelTypeId,
                AgentId = currentUser.AgentId!.Value,
            };
            if (carVM.Photo is null)
            {
                ModelState.AddModelError("Photo", "The image you send cannot be empty");
                return View();
            }
            if (!carVM.Photo.CheckFileType("image/"))
            {
                ModelState.AddModelError("Photo", "The file type is not suitable");
                return View();
            }
            if (!carVM.Photo.CheckFileSize(500))
            {
                ModelState.AddModelError("Photo", "File size should not exceed 500 kb");
                return View();
            }

            CarImage Image = new CarImage()
            {
                Car = car,
                Image = await carVM.Photo.CreateFileAsync(_env.WebRootPath, "assets/img"),
                IsPrimary = true
            };
            car.CarImages.Add(Image);
            TempData["FileWarning"] = "";
            foreach (IFormFile photo in carVM.Photos)
            {
                if (!photo.CheckFileType("image/"))
                {
                    TempData["FileWarning"] += $"{photo.FileName} The file type is not suitable\n";
                    continue;
                }
                if (!photo.CheckFileSize(200))

                {
                    TempData["FileWarning"] += $"{photo.FileName} File size should not exceed 500 kb\n";
                    continue;
                }
                CarImage addImage = new CarImage
                {
                    Image = await photo.CreateFileAsync(_env.WebRootPath, "assets/img"),
                    Car = car,
                    IsPrimary = false
                };
                car.CarImages.Add(addImage);
            }
            await _context.Cars.AddAsync(car);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Seller));
        }
        [HttpGet]
        public async Task<IActionResult> Update(int? id)
        {
            ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
            ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
            ViewBag.Colors = await _context.Colors.ToListAsync();

            if (id is null || id <= 0) return BadRequest();
            Car car = await _context.Cars
                .Where(c => c.Id == id)
                .Include(c => c.CarImages)
                .Include(c => c.BodyStyle)
                .Include(c => c.FuelType)
                .Include(c => c.Color)
                .FirstOrDefaultAsync();
            if (car is null) return NotFound();

            UpdateCarVM carVM = new UpdateCarVM()
            {
                Brand = car.Brand,
                March = car.March,
                Model = car.Model,
                Transmission = car.Transmission,
                Location = car.Location,
                Engine = car.Engine,
                Description = car.Description,
                GraduationYear = car.GraduationYear,
                Price = car.Price,
                HorsePower = car.HorsePower,
                ColorId = car.ColorId,
                BodyStyleId = car.BodyStyleId,
                FuelTypeId = car.FuelTypeId,
                IsRent = car.IsRent,
            };
            return View(carVM);
        }
        [HttpPost]
        public async Task<IActionResult> Update(int? id, UpdateCarVM carVM)
        {
            ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
            ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
            ViewBag.Colors = await _context.Colors.ToListAsync();

            if (!ModelState.IsValid)
            {
                ViewBag.BodyStyles = await _context.BodyStyles.ToListAsync();
                ViewBag.FuelTypes = await _context.FuelTypes.ToListAsync();
                ViewBag.Colors = await _context.Colors.ToListAsync();
                return View();
            }
            if (id is null || id <= 0) return BadRequest();
            Car existed = await _context.Cars
                .Where(c => c.Id == id)
                .Include(c => c.CarImages)
                .Include(c => c.BodyStyle)
                .Include(c => c.FuelType)
                .Include(c => c.Color)
                .FirstOrDefaultAsync(c=>c.Id==id);
            if (existed is null) return NotFound();
            if (!await _context.BodyStyles.AnyAsync(c => c.Id == carVM.BodyStyleId))
            {
                ModelState.AddModelError("BodyStyleId", "There is no such Body Style");
                return View(existed);
            }
            if (!await _context.FuelTypes.AnyAsync(c => c.Id == carVM.FuelTypeId))
            {
                ModelState.AddModelError("FuelTypeId", "There is no such Fuel Type");
                return View(existed);
            }
            if (!await _context.Colors.AnyAsync(c => c.Id == carVM.ColorId))
            {
                ModelState.AddModelError("ColorId", "There is no such Color");
                return View(existed);
            }
            existed.BodyStyleId = carVM.BodyStyleId;
            existed.FuelTypeId = carVM.FuelTypeId;
            existed.ColorId = carVM.ColorId;
            existed.Brand = carVM.Brand;
            existed.Model = carVM.Model;
            existed.March = carVM.March;
            existed.GraduationYear = carVM.GraduationYear;
            existed.Price = carVM.Price;
            existed.Location = carVM.Location;
            existed.Transmission = carVM.Transmission;
            existed.HorsePower = carVM.HorsePower;
            existed.Description = carVM.Description;
            existed.IsRent = carVM.IsRent;
            if (carVM.Photo != null)
            {
                if (!carVM.Photo.CheckFileType("image/"))
                {
                    ModelState.AddModelError("Photo", "The file type is not suitable");
                    return View();
                }
                if (!carVM.Photo.CheckFileSize(500))
                {
                    ModelState.AddModelError("Photo", "File size should not exceed 500 kb");
                    return View();
                }

                var Photo = existed.CarImages.FirstOrDefault(pi => pi.IsPrimary == true);
                Photo.Image.DeleteFile(_env.WebRootPath, "assets/img");
                existed.CarImages.Remove(Photo);
                CarImage Image = new CarImage()
                {
                    Car = existed,
                    Image = await carVM.Photo.CreateFileAsync(_env.WebRootPath, "assets/img"),
                    IsPrimary = true
                };
                existed.CarImages.Add(Image);
            }

            if (carVM.Photos != null)
            {
                TempData["FileWarning"] = "";
                foreach (IFormFile photo in carVM.Photos)
                {
                    if (!photo.CheckFileType("image/"))
                    {
                        TempData["FileWarning"] += $"{photo.FileName} The file type is not suitable\n";
                        continue;
                    }
                    if (!photo.CheckFileSize(200))

                    {
                        TempData["FileWarning"] += $"{photo.FileName} File size should not exceed 500 kb\n";
                        continue;
                    }
                    CarImage addImage = new CarImage
                    {
                        Image = await photo.CreateFileAsync(_env.WebRootPath, "assets/img"),
                        Car = existed,
                        IsPrimary = false
                    };
                    existed.CarImages.Add(addImage);
                }
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Seller));

        }
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || id < 1) return BadRequest();

            Car existed = await _context.Cars.FirstOrDefaultAsync(c => c.Id == id);

            if (existed == null) return NotFound();


            _context.Cars.Remove(existed);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Seller));
        }


        public async Task<IActionResult> Member()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);

            MyProfileVM myProfileVM = new MyProfileVM() { 
            
            Username = user.UserName
            };
            return View(myProfileVM);
        }

        
        public async Task<IActionResult> EditMember()
        {
            //if (id is null ) return BadRequest();
            var user = await _userManager.FindByNameAsync(User.Identity!.Name);
            //AppUser users = (AppUser)await _userManager.GetUsersInRoleAsync(UserRole.Member.ToString());
            if (user == null) return NotFound();
            EditProfileVM Profile = new EditProfileVM() 
            {
                Name = user.Name,
                Surname = user.Surname,
                ImageURL = user.ImageURL,
                Email = user.Email,
               
            };

            return View(Profile);
        }
        [HttpPost]
        public async Task<IActionResult> EditMember( EditProfileVM appUser)
        {
            

            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            var existed = await _userManager.FindByNameAsync(User.Identity!.Name);
            //var existed = await _userManager.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            //AppUser users = (AppUser)await _userManager.GetUsersInRoleAsync(UserRole.Member.ToString());
            if (existed == null) return NotFound();

            existed.Name = appUser.Name;
            existed.Surname = appUser.Surname;
           
            existed.Email = appUser.Email;
            

            if (appUser.Photo != null)
            {
                if (!appUser.Photo.CheckFileType("image/"))
                {
                    ModelState.AddModelError("Photo", "The file type is not suitable");
                    return View();
                }
                if (!appUser.Photo.CheckFileSize(500))
                {
                    ModelState.AddModelError("Photo", "File size should not exceed 500 kb");
                    return View();
                }
                existed.ImageURL.DeleteFile(_env.WebRootPath, "assets/img");
                existed.ImageURL = await appUser.Photo.CreateFileAsync(_env.WebRootPath, "assets/img");
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Member));
        }

        public async Task<IActionResult> EditSeller(int? id)
        {
            if (id is null || id < 1) return BadRequest();

            Agent agent = await _context.Agents.FirstOrDefaultAsync(s => s.Id == id);

            if (agent is null) return NotFound();
            AgentVM agentVM = new AgentVM() { 
              Agent = agent 
              
            };
         
                
            
            return View(agentVM);
        }
        [HttpPost]
        public async Task<IActionResult> EditSeller(int? id, Agent agent)
        {
            if (id is null || id < 1) return BadRequest();
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            Agent existed = await _context.Agents.FirstOrDefaultAsync(s => s.Id == id);
            existed.Name = agent.Name;
            existed.Surname = agent.Surname;
            existed.Address = agent.Address;
            existed.Mobile = agent.Mobile;
            existed.Email = agent.Email;
            if (existed is null) return NotFound();
            if (agent.Photo  != null)
            {
                if (!agent.Photo.CheckFileType("image/"))
                {
                    ModelState.AddModelError("Photo", "The file type is not suitable");
                    return View();
                }
                if (!agent.Photo.CheckFileSize(500))
                {
                    ModelState.AddModelError("Photo", "File size should not exceed 500 kb");
                    return View();
                }
                existed.Image.DeleteFile(_env.WebRootPath, "assets/img");
                existed.Image = await agent.Photo.CreateFileAsync(_env.WebRootPath, "assets/img");
            }
                 
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Seller));
        }

    }
}
