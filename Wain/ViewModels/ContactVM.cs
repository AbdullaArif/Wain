
using System.ComponentModel.DataAnnotations;
using Wain.Models;

namespace Wain.ViewModels
{
    public class ContactVM
    {
        public string? Name { get; set; }
        
        public string Email { get; set; }
        public string? Subject { get; set; }
        public string? Number { get; set; }
        [Required]
        public string Message { get; set; }
        public List<Contact> Items { get; set; }
        public decimal CurrentPage { get; set; }
        public decimal TotalPage { get; set; }
    }
}
