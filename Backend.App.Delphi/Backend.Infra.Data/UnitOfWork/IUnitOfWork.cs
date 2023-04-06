using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Infra.Data.UnitOfWork;

public interface IUnitOfWork
{
    Task<int> CommitAsync();
    Task RolbackAsync();
}
