using Wain.Models;


namespace Wain.ViewModels
{
    public class HomeVM
    {
        public List<Models.Slide> Sliders { get; set; }
        public List<Car> Cars { get; set; }
        public Car Car { get; set; }
        public List<BodyStyle> BodyStyles { get; set; }
        public List<FuelType> FuelTypes { get; set; }
        public List<Color> Colors { get; set; }
    }
}
