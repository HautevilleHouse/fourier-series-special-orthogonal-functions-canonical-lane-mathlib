import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure HarmonicAnalysisApplicationsPackage where
  heatEquation : Type u
  waveEquation : Type v
  poissonEquation : Type w
  signalProcessing : Prop
  quantumMechanics : Prop
  sphericalHarmonics : Prop
  sobolevSpaces : Prop

def HarmonicAnalysisApplicationsClosed (H : HarmonicAnalysisApplicationsPackage) : Prop :=
  H.heatEquation ∧ H.waveEquation ∧ H.poissonEquation ∧ H.sphericalHarmonics ∧ H.sobolevSpaces

structure HarmonicAnalysisApplicationsEvidence (H : HarmonicAnalysisApplicationsPackage) where
  heatEquationClosed : H.heatEquation
  waveEquationClosed : H.waveEquation
  poissonEquationClosed : H.poissonEquation
  sphericalHarmonicsClosed : H.sphericalHarmonics
  sobolevSpacesClosed : H.sobolevSpaces

theorem harmonic_analysis_applications_closed_from_evidence (H : HarmonicAnalysisApplicationsPackage)
    (E : HarmonicAnalysisApplicationsEvidence H) : HarmonicAnalysisApplicationsClosed H := by
  exact And.intro E.heatEquationClosed
    (And.intro E.waveEquationClosed
      (And.intro E.poissonEquationClosed
        (And.intro E.sphericalHarmonicsClosed E.sobolevSpacesClosed)))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse