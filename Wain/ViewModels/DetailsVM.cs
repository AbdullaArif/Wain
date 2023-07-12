using Wain.Models;

namespace Wain.ViewModels
{
    public class DetailsVM
    {
        public decimal CarPrice { get; set; }
        public DateTime RentalDate { get; set; }
        public int RentalDays { get; set; }
        public Car Car { get; set; }
        public Agent Agent { get; set; }
        public List<Car> Cars { get; set; }
        public List<BodyStyle> BodyStyles { get; set; }
        public List<FuelType> FuelTypes { get; set; }
        public List<Color> Colors { get; set; }
    }
}
