using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Domain.Entities;

public class Entity
{
    public long Id { get; init; }
    public DateTime DataInclusao { get; init; } = DateTime.Now;
    public DateTime DataAlteracao { get; init; } = DateTime.Now;
}
