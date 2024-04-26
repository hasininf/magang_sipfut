@extends('template')
@section('content')
    <div class="container col-6">
        <div class="box-body">
            <form action="/jadwal/{{ $jadwalLapangan->id }}" method="POST">
                @csrf
                @method('PUT')
                @php
                    $selected = '';
                @endphp

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Lapangan</label>
                    <select class="form-select" aria-label="Default select example" name="idlapangan">
                        @foreach ($lapangans as $row)
                            <option value="{{ $row->id }}">{{ $row->nama }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Waktu</label>
                    <input type="text" value="{{ $jadwalLapangan->jam }}" name="waktu" class="form-control"
                        id="exampleFormControlInput1" placeholder="Ex. 07:00">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-outline-success">Simpan Jadwal</button>
                    <button type="reset" class="btn btn-outline-danger">Batal</button>
                </div>
            </form>
        </div>
    </div>
@endsection
