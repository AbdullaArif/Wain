namespace Wain.Models
{
    public class FuelType : BaseEntity
    {
        public string Name { get; set; }
        public List<Car> Cars { get; set; }
    }
}
