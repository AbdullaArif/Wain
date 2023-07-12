using System.ComponentModel.DataAnnotations.Schema;

namespace Wain.Models
{
    public class Agent : BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string? Image { get; set; }
      
        public List<Car>? Car { get; set; }

        [NotMapped]
        public IFormFile? Photo { get; set; }
    }
}
