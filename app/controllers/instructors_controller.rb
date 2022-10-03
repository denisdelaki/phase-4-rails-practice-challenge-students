class InstructorsController < ApplicationController

def index 
instructors=Instructor.all 
render json: instructors
end 
def show 
instructor=Instructor.find_by(id: params[:id])
if instructor 
    render json: instructor
else 
    render json: {error: "instructor not found"}
end
end
def create 
instructor=Instructor.create(instructor_params)
if instructor.valid? 
    render json: instructor, status: :created
else 
    render json: {errors: ["validation errors"]}, status: :unprocessable_entity
end
end
def update 
instructor=Instructor.find_by(id: params[:id])
if instructor 
instructor.update(instructor_params)
render json: instructor, status: :accepted
else 
render json: {error: "instructor not found"}, status: :not_found
end
end 
def destroy
instructor=Instructor.find_by(id: params[:id])
if instructor
instructor.destroy 
render json: {message: "instructor details deleted successfully"}, status: :ok 
else 
render json: {error: "instructor not found"}, status: :not_found
end
end
private 
def instructor_params
params.permit(:name)
end
end
