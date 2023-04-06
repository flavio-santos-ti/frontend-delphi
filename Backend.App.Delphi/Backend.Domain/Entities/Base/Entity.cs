using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Domain.Entities.Base;

public abstract class Entity
{
    public long Id { get; init; }
    public DateTime DataInclusao { get; set; }
    public DateTime DataAlteracao { get; set; } 
}
