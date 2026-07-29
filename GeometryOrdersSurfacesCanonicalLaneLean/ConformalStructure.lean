import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure ConformalStructurePackage where
  surface : Type u
  topology : TopologicalSpace surface
  conformalClass : Type v
  compatibleMetric : Type w
  gaussCurvature : Type x
  uniformizationTheorem : Prop
  conformalInvariant : Prop
  isothermalCoordinates : Prop
  curvatureSignClassification : Prop

structure ConformalStructureEvidence (C : ConformalStructurePackage) where
  uniformizationTheoremClosed : C.uniformizationTheorem
  conformalInvariantClosed : C.conformalInvariant
  isothermalCoordinatesClosed : C.isothermalCoordinates
  curvatureSignClassificationClosed : C.curvatureSignClassification

def ConformalStructureClosed (C : ConformalStructurePackage) : Prop :=
  C.uniformizationTheorem ∧ C.conformalInvariant ∧ C.isothermalCoordinates ∧ C.curvatureSignClassification

theorem conformal_structure_closed_from_evidence (C : ConformalStructurePackage) (E : ConformalStructureEvidence C) :
    ConformalStructureClosed C := by
  exact And.intro E.uniformizationTheoremClosed
    (And.intro E.conformalInvariantClosed
      (And.intro E.isothermalCoordinatesClosed E.curvatureSignClassificationClosed))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse