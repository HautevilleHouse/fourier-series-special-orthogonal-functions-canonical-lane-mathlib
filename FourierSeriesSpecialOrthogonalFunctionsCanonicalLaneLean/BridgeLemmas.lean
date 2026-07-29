import canonicalLaneMathlib.AdmissibleClass
import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FourierWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse