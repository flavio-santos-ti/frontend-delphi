using Backend.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Infra.Data.Mappings;

public class PessoaMapping : IEntityTypeConfiguration<Pessoa>
{
    public void Configure(EntityTypeBuilder<Pessoa> builder)
    {
        builder.ToTable("pessoa");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id).HasColumnName("id");
        builder.Property(x => x.Nome).HasColumnName("nome");
        builder.Property(x => x.Sobrenome).HasColumnName("sobrenome");
        builder.Property(x => x.Cep).HasColumnName("cep");
        builder.Property(x => x.Logradouro).HasColumnName("logradouro");
        builder.Property(x => x.Numero).HasColumnName("numero");
        builder.Property(x => x.Complemento).HasColumnName("complemento");
        builder.Property(x => x.Bairro).HasColumnName("bairro");
        builder.Property(x => x.Municipio).HasColumnName("municipio");
        builder.Property(x => x.UF).HasColumnName("uf");
        builder.Property(x => x.DataInclusao).HasColumnName("dt_inclusao");
        builder.Property(x => x.DataAlteracao).HasColumnName("dt_alteracao");
    }

}
