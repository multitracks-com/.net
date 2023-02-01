﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Threading.Tasks;
using Web_Api__multitracks.Models;

namespace Web_Api__multitracks.Data
{
    public partial interface IMultiTracksDBContextProcedures
    {
        Task<List<GetArtistDetailsResult>> GetArtistDetailsAsync(int? artistID, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<List<GetAssessmentStepsResult>> GetAssessmentStepsAsync(int? stepID, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
    }
}
