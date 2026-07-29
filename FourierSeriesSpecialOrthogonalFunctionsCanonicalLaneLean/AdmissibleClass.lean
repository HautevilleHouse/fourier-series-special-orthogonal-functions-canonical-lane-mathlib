import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure FourierAdmittedObject where
  functionSpace : Type
  innerProduct : functionSpace → functionSpace → ℝ
  orthonormalSystem : functionSpace → ℕ → functionSpace
  completeness : Prop
  orthogonalProjection : functionSpace → functionSpace
  parsevalIdentity : Prop
  conclusion : parsevalIdentity

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse