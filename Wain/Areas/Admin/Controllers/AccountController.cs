using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Wain.Interfaces;
using Wain.Models;
using Wain.Utilities.Enums;
using Wain.Utilities.Extensions;
using Wain.ViewModels.Account;

namespace Wain.Areas.Admin.Controllers
{
	[Area("Admin")]
	public class AccountController : Controller
	{
		private readonly UserManager<AppUser> _userManager;
		private readonly SignInManager<AppUser> _signInManager;
		private readonly RoleManager<IdentityRole> _roleManager;
		private readonly IWebHostEnvironment _env;
		private readonly IEmailService _emailService;
		public AccountController(
		   UserManager<AppUser> userManager,
		   SignInManager<AppUser> signInManager,
		   RoleManager<IdentityRole> roleManager,
		   IWebHostEnvironment env,
		   IEmailService emailService
			)
		{
			_userManager = userManager;
			_signInManager = signInManager;
			_roleManager = roleManager;
			_env = env;
			_emailService = emailService;
		}
		public IActionResult Register()
		{
			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Register(RegisterVM newUser)
		{
			if (!ModelState.IsValid)
			{
				return View();
			}
			if (newUser.Photo is null)
			{
				ModelState.AddModelError("Photo", "The image you send cannot be empty");
				return View();
			}
			if (!newUser.Photo.CheckFileType("image/"))
			{
				ModelState.AddModelError("Photo", "The file type is not suitable");
				return View();
			}
			if (!newUser.Photo.CheckFileSize(200))
			{
				ModelState.AddModelError("Photo", "File size should not exceed 200 kb");
				return View();
			}
			AppUser user = new AppUser
			{
				Name = newUser.Name,
				Surname = newUser.Surname,
				Email = newUser.Email,
				UserName = newUser.Username,
				ImageURL = await newUser.Photo.CreateFileAsync(_env.WebRootPath, "assets/img")
			};
			//automapper
			IdentityResult result = await _userManager.CreateAsync(user, newUser.Password);
			if (!result.Succeeded)
			{
				foreach (IdentityError error in result.Errors)
				{
					ModelState.AddModelError("", error.Description);
				}
				return View();
			}

			if (newUser.IsSeller == true)
			{
				await _userManager.AddToRoleAsync(user, UserRole.Seller.ToString());
				Agent agent = new Agent()
				{
					Name = newUser.Name,
					Surname = newUser.Surname,
					Email = newUser.Email,
					Mobile = newUser.Mobile,
					Address = newUser.Address,
					Image = await newUser.Photo.CreateFileAsync(_env.WebRootPath, "assets/img")
				};
				user.Agent = agent;
				await _userManager.UpdateAsync(user);
			}
			else { await _userManager.AddToRoleAsync(user, UserRole.Member.ToString()); }
			await _signInManager.SignInAsync(user, false);
			return RedirectToAction("Index", "Home", new { area = "" });
		}

		public async Task<IActionResult> Login()
		{

			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Login(LoginVM user, string? ReturnUrl)
		{

			if (!ModelState.IsValid)
			{
				return View();
			}
			AppUser existed = await _userManager.FindByEmailAsync(user.UsernameOrEmail);
			if (existed == null)
			{
				existed = await _userManager.FindByNameAsync(user.UsernameOrEmail);
				if (existed == null)
				{
					ModelState.AddModelError(string.Empty, "Username, Email or Password is not correct");
					return View();
				}
			}
			if(!await _userManager.CheckPasswordAsync(existed, user.Password))
			{
				ModelState.AddModelError("", "Username, Email or Password is not correct");
                return View();
            }	
			var result = await _signInManager.PasswordSignInAsync(existed, user.Password, user.IsRemember, true);
			if (result.IsLockedOut)
			{
				ModelState.AddModelError(string.Empty, "Login is not available now, please try again later");
                return View();
            }
			if (!result.Succeeded)
			{
				ModelState.AddModelError(string.Empty, "Username, Email or Password is not correct");
				return View();
			}
			if (ReturnUrl != null)
			{
				return Redirect(ReturnUrl);
			}

			string body = @"<table>
                           <thead>
                               <tr>
                                   <th>Notification</th>
                               </tr>
                               <tr>
                                   <th>Login successful . Welcome to our Wain Rent a car page</th>
                               </tr>
                           </thead>
                           <tbody>";
			await _emailService.SendMail(existed.Email, "Order Placement", body, true);
			return RedirectToAction("Index", "Home", new { area = "" });
		}
		public async Task<IActionResult> LogOut()
		{
			await _signInManager.SignOutAsync();
			return RedirectToAction("Index", "Home", new { area = "" });
		}

		public IActionResult ForgotPassword()
		{
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> ForgotPassword(ForgotPasswordVM forgotPasswordVM)
		{
			if (!ModelState.IsValid) { return View(); }
			var user = await _userManager.FindByEmailAsync(forgotPasswordVM.Email);
			if (user is null) { NotFound(); }
			string token = await _userManager.GeneratePasswordResetTokenAsync(user);
			string link = Url.Action("ResetPassword", "Account", new { userId = user.Id, token = token }, HttpContext.Request.Scheme);
			string body = $@"<!DOCTYPE html>
                                         <html>
                                         <head>
                                             <title>Security Warning</title>
                                             <style>
                                                 body {{
                                                     font-family: Arial, sans-serif;
                                                     background-color: #f9f9f9;
                                                     margin: 0;
                                                     padding: 0;
                                                 }}
                                                 
                                                 .container {{
                                                     max-width: 600px;
                                                     margin: 20px auto;
                                                     background-color: #ffffff;
                                                     padding: 20px;
                                                     border-radius: 5px;
                                                     box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                                 }}
                                                 
                                                 h1 {{
                                                     font-size: 24px;
                                                     color: #ff0000;
                                                     margin-top: 0;
                                                 }}
                                                 
                                                 p {{
                                                     font-size: 16px;
                                                     color: #333333;
                                                 }}
                                             </style>
                                         </head>
                                         <body>
                                             <div class=""container"">
                                                 <h1>Security Warning</h1>
                                                 <p>You logged in on <span>{link}</span>.</p>
                                             </div>
                                         </body>
                                         </html>
                                         ";
			await _emailService.SendMail(user.Email, "Reset Password", body, true);
			return RedirectToAction(nameof(Login));
		}
		public async Task<IActionResult> ResetPassword(string userId, string token)
		{
			if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(token)) return BadRequest();
			var user = await _userManager.FindByIdAsync(userId);
			if (user == null) return NotFound();
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]

		public async Task<IActionResult> ResetPassword(ResetPasswordVM resetPassword, string userId, string token)
		{
			if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(token)) return BadRequest();
			if (!ModelState.IsValid) return View(resetPassword);
			var user = await _userManager.FindByIdAsync(userId);
			if (user == null) return NotFound();
			var identityUser = await _userManager.ResetPasswordAsync(user, token, resetPassword.ConfirmPassword);
			return RedirectToAction(nameof(Login));


		}
		[Authorize(Roles = "Admin")]
		public async Task<IActionResult> CreateRoles()
		{
			foreach (var role in Enum.GetValues(typeof(UserRole)))
			{
				if (!(await _roleManager.RoleExistsAsync(role.ToString())))
				{
					await _roleManager.CreateAsync(new IdentityRole { Name = role.ToString() });
				}
			}
			return RedirectToAction("Index", "Home");
		}
	}
}
