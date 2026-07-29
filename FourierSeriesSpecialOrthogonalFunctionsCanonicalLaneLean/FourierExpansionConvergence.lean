import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure FourierExpansionConvergencePackage where
  functionSpace : Type
  orthonormalBasis : Type
  expansionCoefficients : Type
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  meanSquareConvergence : Prop

structure FourierExpansionConvergenceEvidence (F : FourierExpansionConvergencePackage) where
  pointwiseConvergenceClosed : F.pointwiseConvergence
  uniformConvergenceClosed : F.uniformConvergence
  meanSquareConvergenceClosed : F.meanSquareConvergence

def FourierExpansionConvergenceClosed (F : FourierExpansionConvergencePackage) : Prop :=
  F.pointwiseConvergence ∧ F.uniformConvergence ∧ F.meanSquareConvergence

theorem fourier_expansion_convergence_closed_from_evidence
    (F : FourierExpansionConvergencePackage) (E : FourierExpansionConvergenceEvidence F) :
    FourierExpansionConvergenceClosed F := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed E.meanSquareConvergenceClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse