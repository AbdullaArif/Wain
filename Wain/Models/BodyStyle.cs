namespace Wain.Models
{
    public class BodyStyle:BaseEntity
    {
        public string Name { get; set; }
        public List<Car> Cars { get; set; }
    }
}
