namespace WebSocialNetwork.Models.ViewModels
{
    public class MessageViewModel
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }
        public string FromUserName { get; set; }
        public string FromFullName { get; set; }
        public string Room { get; set; }
        public string Avatar { get; set; }
    }
}
