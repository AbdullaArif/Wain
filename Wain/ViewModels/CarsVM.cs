using Wain.Models;

namespace Wain.ViewModels
{
    public class CarsVM
    {
        public Car Car { get; set; }
        public List<Car> Cars { get; set; }
        public List<BodyStyle> BodyStyles { get; set; }
        public List<FuelType> FuelTypes { get; set; }
        public List<Color> Colors { get; set; }
     
        public List<Car> Items { get; set; }
        public decimal CurrentPage { get; set; }
        public decimal TotalPage { get; set; }


    }
}
