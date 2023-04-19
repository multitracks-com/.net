using System;
using System.Collections.Generic;

namespace DAL_EF.Models;

public partial class AssessmentStep
{
    public int StepId { get; set; }

    public string Text { get; set; } = null!;
}
