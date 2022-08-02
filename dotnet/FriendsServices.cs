using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain.Friends;
using Sabio.Models.Requests.Friends;

namespace Sabio.Services.Friends
{
    public class FriendsServices : IFriendsServices
    {
        private IDataProvider _data = null;

        public FriendsServices(IDataProvider data)
        {   
            _data = data;
        }

        public void Add(FriendRequest model, int senderUserId)
        {
            string procName = "[dbo].[ConnectedFriends_Insert]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection collection)
                {
                    FriendsParams(model, collection, senderUserId);
                },
                returnParameters: null);
        }

        public void Update(FriendRequest model, int senderUserId )
        {
            string procName = "[dbo].[ConnectedFriends_Update]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection collection)
                {
                    FriendsParams(model, collection, senderUserId);
                },
                returnParameters: null);
        }

        public Paged<Friend> GetPage(int pageIndex, int pageSize)
        {
            Paged<Friend> pagedResult = null;

            List<Friend> result = null;

            int totalCount = 0;

            string procName = "[dbo].[ConnectedFriends_SelectAll]";
            _data.ExecuteCmd(procName,
                inputParamMapper: delegate (SqlParameterCollection paramCollection)
                {
                    paramCollection.AddWithValue("@PageIndex", pageIndex);
                    paramCollection.AddWithValue("@PageSize", pageSize);
                },
                singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    int startingIndex;
                    Friend ConnecetedFriend;
                    FriendMapper(reader, out startingIndex, out ConnecetedFriend);

                    if (totalCount == 0)
                    {
                        totalCount = reader.GetSafeInt32(startingIndex++);
                    }
                    if (result == null)
                    {
                        result = new List<Friend>();
                    }
                    result.Add(ConnecetedFriend);
                }
            );
            if (result != null)
            {
                pagedResult = new Paged<Friend>(result, pageIndex, pageSize, totalCount);
            }
            return pagedResult;
        }

        private static void FriendMapper(IDataReader reader, out int startingIndex, out Friend ConnecetedFriend)
        {
            startingIndex = 0;
            ConnecetedFriend = new Friend();
            ConnecetedFriend.SenderId = reader.GetSafeInt32(startingIndex++);
            ConnecetedFriend.RecipientId = reader.GetSafeInt32(startingIndex++);
            ConnecetedFriend.StatusId = reader.GetSafeInt32(startingIndex++);
           
        }

        private static void FriendsParams(FriendRequest model, SqlParameterCollection collection, int senderUserId)
        {
            collection.AddWithValue("@SenderId", senderUserId);
            collection.AddWithValue("@RecipientId", model.RecipientId);
            collection.AddWithValue("@StatusId", model.StatusId); 
        }

    }
}
