using Sabio.Models;
using Sabio.Models.Domain.Friends;
using Sabio.Models.Requests.Friends;

namespace Sabio.Services.Friends;

public interface IFriendsServices
{
    void Add(FriendRequest model, int senderUserId);

    void Update (FriendRequest model, int senderUserId);
    
    Paged<Friend> GetPage(int pageIndex, int pageSize);
}