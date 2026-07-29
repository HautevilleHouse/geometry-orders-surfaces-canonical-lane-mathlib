import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure UniformizationPackage where
  surface : Type u
  topology : TopologicalSpace surface
  riemannianMetric : Type v
  conformalMetric : Type w
  constantCurvatureMetric : Type w
  uniformizationStatement : Prop
  metricConformalToOriginal : Prop
  constantCurvature : ℝ

structure UniformizationEvidence (U : UniformizationPackage) where
  uniformizationStatementClosed : U.uniformizationStatement
  metricConformalToOriginalClosed : U.metricConformalToOriginal
  constantCurvatureClosed : U.constantCurvature = 0 ∨ U.constantCurvature = 1 ∨ U.constantCurvature = -1

def UniformizationClosed (U : UniformizationPackage) : Prop :=
  U.uniformizationStatement ∧ U.metricConformalToOriginal ∧ (U.constantCurvature = 0 ∨ U.constantCurvature = 1 ∨ U.constantCurvature = -1)

theorem uniformization_closed_from_evidence (U : UniformizationPackage)
    (E : UniformizationEvidence U) : UniformizationClosed U := by
  exact And.intro E.uniformizationStatementClosed
    (And.intro E.metricConformalToOriginalClosed E.constantCurvatureClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse