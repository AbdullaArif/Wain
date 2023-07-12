using System.ComponentModel.DataAnnotations;

namespace Wain.Models
{
    public class Slide:BaseEntity
    {
        [Required]
        [MaxLength(100)]
        public string Title { get; set; }
        [Required]
        [MaxLength(300)]
        public string SubTitle { get; set; }
        public string Image { get; set; }
        public int Order { get; set; }
    }
}
