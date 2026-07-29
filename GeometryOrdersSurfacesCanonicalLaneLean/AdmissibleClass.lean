import GeometryOrdersSurfacesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure AdmissibleClass where
  object : GeometryOrdersSurfacesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeometryOrdersSurfacesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse