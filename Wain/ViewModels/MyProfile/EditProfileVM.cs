using System.ComponentModel.DataAnnotations.Schema;

namespace Wain.ViewModels.MyProfile
{
    public class EditProfileVM
    {
        public string? Name { get; set; }
        public string? Surname { get; set; }
        public string? Email { get; set; }
        public string? ImageURL { get; set; }

        public IFormFile? Photo { get; set; }

    }
}
