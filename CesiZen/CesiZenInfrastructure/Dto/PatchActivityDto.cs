﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CesiZenInfrastructure.Dto
{
    public class PatchActivityDto
    {
        public int? Id { get; set; }
        public string? Nom { get; set; }
        public string? Description { get; set; }

        public string? ContenuHtml { get; set; }
    }
}
