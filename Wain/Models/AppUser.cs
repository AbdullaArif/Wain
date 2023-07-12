using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace Wain.Models
{
    public class AppUser : IdentityUser
    {
        public string Name { get; set; }
        public string Surname { get; set; }       
        public string? ImageURL { get; set; }     
        public Agent? Agent { get; set; }
        public int? AgentId { get; set; }
        [NotMapped]
        public IFormFile? Photo { get; set; }

    }
}
