class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @users = User.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @result = `algo run matching/DatingAlgorithm/0.1.3 -d '{
    "scoring_weights": {
      "interests": 1.5,
      "values": 7.5,
      "age": 0.65,
      "coordinates": 0.015
    },
    "group1": [
    {
        "name": "Rene van den Bedem",
        "interests": [
            "VCDX",
            "NPX",
            "Togaf",
            "Enterprise Architect",
            "Master Enterprise Architect"
        ],
        "values": [
            "individuality"
        ],
        "age": "56",
        "coordinates": {
            "lat": 47.599088077746394,
            "long": -122.3339125374332
        }
    },
    {
        "name": "Timothy Patterson",
        "interests": [
            "AWS",
            "PowerShell",
            "Python",
            "Devops",
            "storage"
        ],
        "values": [
            "spirituality"
        ],
        "age": "32",
        "coordinates": {
            "lat": 47.599088077746394,
            "long": -122.3339125374332
        }
    }
    ,{
        "name": "Lior Kamrat",
        "interests": [
            "HyperV",
            "Azure",
            "networking",
            "Javascript",
            "VMware"
        ],
        "values": [
            "individuality",
            "freedom of speech"
        ],
        "age": "25",
        "coordinates": {
            "lat": 47.599088077746394,
            "long": -122.3339125374332
        }
    },
    {
        "name": "Katarina Wagnerova",
        "interests": [
            "vmware",
            "vrealize",
            "PowerShell",
            "Terraform",
            "cloud"
        ],
        "values": [
            "good food"
        ],
        "age": "37",
        "coordinates": {
            "lat": 47.599088077746394,
            "long": -122.3339125374332
        }
    },
    {
        "name": "Byron Schaller",
        "interests": [
            "Ansible",
            "Terraform",
            "Jenkins",
            "Puppet",
            "Chef"
        ],
        "values": [
            "love",
            "relationships"
        ],
        "age": "26",
        "coordinates": {
            "lat": 47.599088077746394,
            "long": -122.3339125374332
        }
    }
],
    "group2": [
    {
        "name": "Mentee 1",
        "interests": [
            "DevOps",
            "programming",
            "PowerShell",
            "networking",
            "HyperV"
        ],
        "values": [
            "individuality"
        ],
        "age": "22",
        "coordinates": {
            "lat": 47.62446091996251,
            "long": -122.32016064226627
        }
    },
    {
        "name": "Mentee 2",
        "interests": [
            "cloud",
            "KVM",
            "programming",
            "networking",
            "VMware"
        ],
        "values": [
            "family",
            "love"
        ],
        "age": "26",
        "coordinates": {
            "lat": 47.62446091996251,
            "long": -122.32016064226627
    }
    },
    {
        "name": "Mentee 3",
        "interests": [
            "artificial intelligence",
            "networking",
            "Javascript",
            "Python",
            "VMware"
        ],
        "values": [
            "vegetarianism",
            "individuality"
        ],
        "age": "39",
        "coordinates": {
            "lat": 47.62446091996251,
            "long": -122.32016064226627
    }
    },
    {
        "name": "Mentee 4",
        "interests": [
            "artificial intelligence",
            "HyperV",
            "Microsoft Azure",
            "networking",
            "PowerShell"
        ],
        "values": [
            "love",
            "art"
        ],
        "age": "24",
        "coordinates": {
            "lat": 47.62446091996251,
            "long": -122.32016064226627
        }
    }
]
}' --timeout 300`

  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.fetch(:match, {})
    end
end
