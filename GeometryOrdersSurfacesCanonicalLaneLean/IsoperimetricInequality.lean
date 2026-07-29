import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure IsoperimetricInequalityPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  areaMeasure : Type w
  lengthMeasure : Type x
  isoperimetricConstant : ℝ
  isoperimetricInequality : Prop
  areaLengthRelation : Prop
  constantOptimal : Prop

structure IsoperimetricInequalityEvidence (P : IsoperimetricInequalityPackage) where
  isoperimetricInequalityClosed : P.isoperimetricInequality
  areaLengthRelationClosed : P.areaLengthRelation
  constantOptimalClosed : P.constantOptimal

def IsoperimetricInequalityClosed (P : IsoperimetricInequalityPackage) : Prop :=
  P.isoperimetricInequality ∧ P.areaLengthRelation ∧ P.constantOptimal

theorem isoperimetric_inequality_closed_from_evidence (P : IsoperimetricInequalityPackage) (E : IsoperimetricInequalityEvidence P) : IsoperimetricInequalityClosed P := by
  exact And.intro E.isoperimetricInequalityClosed (And.intro E.areaLengthRelationClosed E.constantOptimalClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse