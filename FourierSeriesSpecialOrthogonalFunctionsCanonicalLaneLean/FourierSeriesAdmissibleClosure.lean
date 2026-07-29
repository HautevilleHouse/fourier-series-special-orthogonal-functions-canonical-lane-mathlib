import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.SphericalHarmonicsExpansion

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

def ConstrainedFourierSeriesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fourier_series_endgame (A : AdmissibleClass) :
    ConstrainedFourierSeriesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse