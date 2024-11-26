// Obtiene los paises
fetch('https://countriesnow.space/api/v0.1/countries')
    .then(response => response.json())
    .then(data => {
        const selectCountry = document.getElementById('select-country');
        data.data.forEach(country => {
            const option = document.createElement('option');
            option.text = country.country;
            option.value = country.country;
            selectCountry.add(option);
        });
    })
    .catch(error => console.error('Error fetching countries:', error));

// Actualiza las ciudades con el pais seleccionado
document.getElementById('select-country').addEventListener('change', function () {
    const selectedCountry = this.value;
    const selectCity = document.getElementById('select-city');
    selectCity.innerHTML = '<option value="" disabled selected>Cargando...</option>';

    const settings = {
        method: 'POST',
        body: JSON.stringify({ country: selectedCountry }),
        headers: {
            'Content-Type': 'application/json',
        }
    };

    fetch('https://countriesnow.space/api/v0.1/countries/states', settings)
        .then(response => response.json())
        .then(data => {
            selectCity.innerHTML = '';
            const cities = data.data.states;
            cities.forEach(city => {
                const option = document.createElement('option');
                option.text = city.name;
                option.value = city.name;
                selectCity.add(option);
                console.log(city)
            });
            console.log(city)
        })
        .catch(error => console.error('Error fetching cities:', error));
});