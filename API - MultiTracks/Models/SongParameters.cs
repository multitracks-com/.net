namespace Web_Api__multitracks.Models
{
    public class SongParameters
    {
        const int maxPageSize = 30; // can have 30 songs maximum in one page 
        public int PageNumber { get; set; } = 1;
        private int _pageSize = 10; // 10 songs 
        public int PageSize
        {
            get
            {
                return _pageSize;
            }
            set
            {
                _pageSize = (value > maxPageSize) ? maxPageSize : value;
            }
        }
    }
}
