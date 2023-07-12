namespace Wain.Models
{
    public class CarImage:BaseEntity
    {
        public string? Image { get; set; }

        public bool IsPrimary { get; set; }
        
        public int CarId { get; set; }
        public Car Car { get; set; }
    }
}
