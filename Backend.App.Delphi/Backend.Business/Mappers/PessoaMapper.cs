using Backend.Domain.Dtos.Pessoa;
using Backend.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Business.Mappers;

public class PessoaMapper : AutoMapper.Profile
{
    public PessoaMapper()
    {
        CreateMap<Pessoa, PessoaCreateDto>().ReverseMap();
        CreateMap<Pessoa, PessoaDto>().ReverseMap();
        CreateMap<Pessoa, PessoaUpdateDto>().ReverseMap();
    }
}
