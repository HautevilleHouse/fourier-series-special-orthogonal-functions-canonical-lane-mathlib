import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure OrthogonalBasisPackage (A : AdmissibleClass) where
  basisFunctions : Type u
  orthogonalityRelation : Prop
  completeness : Prop
  basisFunctionsCountable : Prop

structure OrthogonalBasisEvidence {A : AdmissibleClass} (P : OrthogonalBasisPackage A) where
  orthogonalityRelationClosed : P.orthogonalityRelation
  completenessClosed : P.completeness
  basisFunctionsCountableClosed : P.basisFunctionsCountable

def OrthogonalBasisClosed {A : AdmissibleClass} (P : OrthogonalBasisPackage A) : Prop :=
  P.orthogonalityRelation ∧ P.completeness ∧ P.basisFunctionsCountable

theorem orthogonal_basis_closed_from_evidence {A : AdmissibleClass}
    (P : OrthogonalBasisPackage A) (E : OrthogonalBasisEvidence P) :
    OrthogonalBasisClosed P := by
  exact And.intro E.orthogonalityRelationClosed
    (And.intro E.completenessClosed E.basisFunctionsCountableClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse