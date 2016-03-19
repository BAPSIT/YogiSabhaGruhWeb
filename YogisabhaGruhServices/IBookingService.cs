using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace YSGServices
{
    IEnumerable<Comment> Get();
    bool TryGet(int id, out Comment comment);
    Comment Add(Comment comment);
    bool Delete(int id);
    bool Update(Comment comment);
}
