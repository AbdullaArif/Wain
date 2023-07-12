using System.ComponentModel.DataAnnotations;

namespace Wain.ViewModels.MyProfile
{
    public class UpdateCarVM
    {
        public string Brand { get; set; }
        public string Model { get; set; }
        public int GraduationYear { get; set; }
        public string Engine { get; set; }
        public decimal March { get; set; }
        public decimal Price { get; set; }
        public string Transmission { get; set; }
        public string Location { get; set; }
        public int HorsePower { get; set; }
        public string Description { get; set; }
        public int BodyStyleId { get; set; }
        public int FuelTypeId { get; set; }
        public int ColorId { get; set; }
        public bool IsRent { get; set; }




       
        public IFormFile? Photo { get; set; }
        public List<IFormFile>? Photos { get; set; }
    }
}
