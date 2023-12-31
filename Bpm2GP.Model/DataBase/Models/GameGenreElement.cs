﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;

namespace Bpm2GP.Model.DataBase.Models
{
    public class GameGenreElement
    {
        public virtual Guid Id { get; set; }
        public virtual String Name { get; set; }
        public virtual String Description { get; set; }
        public virtual bool Inactive { get; set; }
        public virtual GameGenre GameGenre { get; set; }
        public virtual IList<AssociationConfElements> AssociationConfElements { get; set; }

        public GameGenreElement()
        {
            this.AssociationConfElements = new List<AssociationConfElements>();
        }
    }

    public class GameGenreElementMap : ClassMapping<GameGenreElement>
    {
        public GameGenreElementMap()
        {
            Table("gamegenreelement");

            Id(x => x.Id, m => m.Generator(Generators.Guid));

            Property(x => x.Name);
            Property(x => x.Description);
            Property(x => x.Inactive);

            ManyToOne(x => x.GameGenre, m =>
            {
                m.Column("idGenre");
                m.Lazy(LazyRelation.NoLazy);
            });

            Bag(x => x.AssociationConfElements, map =>
            {
                map.Cascade(Cascade.DeleteOrphans);
                map.Lazy(CollectionLazy.NoLazy);
                map.Key(k => k.Column("idGenreElement"));
            },
            o => o.OneToMany());
        }
    }
}
