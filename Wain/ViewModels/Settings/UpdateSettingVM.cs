using System.ComponentModel.DataAnnotations;

namespace Wain.ViewModels.Settings
{
    public class UpdateSettingVM
    {
        [Required]
        [MaxLength(100)]
        public string Key { get; set; }
        
        [MaxLength(300)]
        public string Value { get; set; }
    }
}
