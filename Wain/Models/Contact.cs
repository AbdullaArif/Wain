namespace Wain.Models
{
    public class Contact:BaseEntity
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Number { get; set; }
        public string Message { get; set; }
        
    }
}
