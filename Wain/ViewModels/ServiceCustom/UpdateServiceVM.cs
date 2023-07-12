using System.ComponentModel.DataAnnotations;

namespace Wain.ViewModels.ServiceCustom
{
    public class UpdateServiceVM
    {
        [Required]
        [MaxLength(100)]
        public string Key { get; set; }

        [MaxLength(300)]
        public string Value { get; set; }
        public string Description { get; set; }

    }
}
