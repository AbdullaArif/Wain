using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using Wain.Models;
using Wain.Utilities.Enums;

namespace Wain.ViewModels.MyProfile
{
    public class MyProfileVM
    {
        public List<Models.Car> Cars { get; set; }
        public Models.Car Car { get; set; }
        public Agent Agent { get; set; }
        public string Id { get; set; }

        public bool? IsSeller { get; set; }
        [Required]
        [MinLength(3)]
        [MaxLength(25)]
        [RegularExpression("^[a-zA-Z]+$", ErrorMessage = "You can use only letters")]
        public string? Name { get; set; }
        [MinLength(3)]
        [MaxLength(25)]
        [RegularExpression("^[a-zA-Z]+$", ErrorMessage = "You can use only letters")]
        public string? Surname { get; set; }
        [Required]
        public string? Username { get; set; }
        [DataType(DataType.EmailAddress)]
        public string? Email { get; set; }

        [DataType(DataType.Password)]
        public string? Password { get; set; }
        [DataType(DataType.Password)]
        [Compare(nameof(Password))]
        public string? ConfirmPassword { get; set; }
        [DataType(DataType.PhoneNumber)]
        public string? Mobile { get; set; }
        public string? Address { get; set; }
        public IFormFile? Photo { get; set; }
        public string? ImageURL { get; set; }
    }
}
